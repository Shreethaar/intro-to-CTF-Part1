from flask import Flask, render_template, request, send_file
import os

app = Flask(__name__)

# Define the directory from which files can be downloaded
DOWNLOAD_DIR = os.path.join(os.getcwd(), 'downloads')

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/download', methods=['GET'])
def download_file():
    # Get the filename from the request
    filename = request.args.get('file')
    
    # Check if the filename is None or empty
    if not filename:
        return "No filename provided."
    
    # Construct the file path by joining the DOWNLOAD_DIR with the filename
    file_path = os.path.join(DOWNLOAD_DIR, filename)
    
    # Send the file to the user as an attachment
    return send_file(file_path, as_attachment=True)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=1337)

