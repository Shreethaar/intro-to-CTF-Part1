from flask import Flask, render_template, request, send_file, abort
import os

app = Flask(__name__)
DOWNLOAD_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), '../downloads')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/downloads', methods=['GET'])
def download_file():
    filename = request.args.get('file')
    if not filename:
        return "No filename provided.", 400

    file_path = os.path.join(DOWNLOAD_DIR, filename)
    if not os.path.isfile(file_path):
        return abort(404, description="File not found")

    return send_file(file_path, as_attachment=True)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=1337)

