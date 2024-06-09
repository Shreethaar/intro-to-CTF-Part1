from PIL import Image
import zipfile

# Open the PNG image
png_image = Image.open('chall.png')

# Read and decompress the zip file using zipfile
with zipfile.ZipFile('secret.zip', 'r') as zip_ref:
    # Extract all files to a temporary directory
    zip_ref.extractall('extracted_files')

# If you need to read specific files from the zip archive directly, you can do so:
with zipfile.ZipFile('secret.zip', 'r') as zip_ref:
    file_list = zip_ref.namelist()
    print(f"Files in the zip: {file_list}")
    zip_data = zip_ref.read(file_list[0])  # Reading the first file as an example

# Here you would implement your logic to embed zip_data into the PNG image.
# For simplicity, let's assume you have some steganography method or a placeholder.

# Convert the image to a format that supports editing (e.g., 'RGBA')
png_image = png_image.convert('RGBA')

# Get image data
image_data = png_image.tobytes()

# Append the zip data to the image data (not effective for actual steganography)
new_image_data = image_data + zip_data

# Create a new image from the combined data
# Note: Simply appending data to image bytes won't make it visible; this is just for example
new_image = Image.frombytes(png_image.mode, png_image.size, new_image_data[:len(image_data)])

# Save the new image
new_image.save('hidden-flag.png')

