import multiprocessing
import time
import requests
import argparse  # Import the argparse module

# Replace these with your actual server details
SERVER_URL = "http://localhost:8080/items"
# For PUT requests, specify an item ID to update
ITEM_ID_FOR_PUT = 1

def send_get_request():
    while True:
        try:
            response = requests.get(SERVER_URL)
            print(f"GET Response: {response.status_code}, {response.json()}")
        except Exception as e:
            print(f"Error sending GET request: {e}")
        time.sleep(1)

def send_post_request():
    while True:
        try:
            data = {"name": "NewItem"}
            response = requests.post(SERVER_URL, json=data)
            print(f"POST Response: {response.status_code}, {response.json()}")
        except Exception as e:
            print(f"Error sending POST request: {e}")
        time.sleep(1)

def send_put_request():
    while True:
        try:
            data = {"name": "UpdatedItem"}
            response = requests.put(f"{SERVER_URL}/{ITEM_ID_FOR_PUT}", json=data)
            print(f"PUT Response: {response.status_code}, {response.json()}")
        except Exception as e:
            print(f"Error sending PUT request: {e}")
        time.sleep(1)

def run_process(target):
    process = multiprocessing.Process(target=target)
    process.start()
    return process

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Send HTTP requests concurrently.")
    parser.add_argument("--method", choices=["GET", "POST", "PUT"], required=True, help="HTTP method to use")
    args = parser.parse_args()

    # Map method argument to the corresponding function
    method_functions = {
        "GET": send_get_request,
        "POST": send_post_request,
        "PUT": send_put_request
    }
    request_type = method_functions[args.method]

    processes = [run_process(request_type) for _ in range(10)]
    
    # Join processes to prevent the script from exiting immediately
    for process in processes:
        process.join()
