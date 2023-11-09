from flask import Flask, render_template, url_for

app = Flask(__name__)

def get_file_content(file_path):
    """Reads file content from a given file path."""
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            return file.read()
    except IOError as e:
        return str(e)

@app.route('/')
def index():
    profile_text = get_file_content('./static/text.txt')
    stream_source = url_for('static', filename='stream.mp4')  # Ensure this points to your actual stream source.
    image_source = url_for('static', filename='profile.jpg')

    return render_template(
        'index.html',
        profile_text=profile_text,
        stream_source=stream_source,
        image_source=image_source
    )

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080, debug=True)
