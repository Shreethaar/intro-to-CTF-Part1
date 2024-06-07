document.addEventListener("DOMContentLoaded", function() {
    var downloadForm = document.getElementById('downloadForm');
    var filenameInput = document.getElementById('filename');
    var errorMessage = document.getElementById('errorMessage');

    downloadForm.addEventListener('submit', function(event) {
        if (!filenameInput.value.trim()) {
            errorMessage.innerText = 'Please enter a filename.';
            event.preventDefault(); // Prevent form submission
        } else {
            errorMessage.innerText = '';
        }
    });
});

