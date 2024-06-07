document.addEventListener('DOMContentLoaded', function() {
    var paragraph = document.getElementById('myParagraph');
    var button = document.getElementById('colorButton');

    button.addEventListener('click', function() {
        if (paragraph.style.display === 'none') {
            paragraph.style.display = 'block';
        } else {
            paragraph.style.display = 'none';
        }
    });
});

// Flag 3: html_css_js}

