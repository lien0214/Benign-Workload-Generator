from flask import Flask, render_template_string, send_file

app = Flask(__name__)

@app.route('/')
def index():
    # This is a simple inline HTML template with an embedded video element.
    html_content = """
    <!DOCTYPE html>
    <html>
    <head>
        <title>Video Streaming</title>
    </head>
    <body>

    <video width="320" height="240" controls>
      <source src="/video" type="video/mp4">
      Your browser does not support the video tag.
    </video>

    </body>
    </html>
    """
    return render_template_string(html_content)

@app.route('/video')
def video():
    path_to_video = "./src/video.mp4"
    return send_file(path_to_video, conditional=True)

if __name__ == "__main__":
    app.run(debug=True)
