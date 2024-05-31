#!/bin/bash

# Define Morse code for letters, digits, and special characters
declare -A morse_code
morse_code=(
    [A]=".-" [B]="-..." [C]="-.-." [D]="-.." [E]="." [F]="..-."
    [G]="--." [H]="...." [I]=".." [J]=".---" [K]="-.-" [L]=".-.."
    [M]="--" [N]="-." [O]="---" [P]=".--." [Q]="--.-" [R]=".-."
    [S]="..." [T]="-" [U]="..-" [V]="...-" [W]=".--" [X]="-..-"
    [Y]="-.--" [Z]="--.." [0]="-----" [1]=".----" [2]="..---"
    [3]="...--" [4]="....-" [5]="....." [6]="-...." [7]="--..."
    [8]="---.." [9]="----." [.]=". - . - ." [,]="--..--" [?]="..--.."
    [!]="-.-.--" [=]="-...-" [@]=".--.-." [ ]=" "
)

# Function to generate a tone for a dot (.)
generate_dot() {
    sox -n -r 44100 -b 16 dot.wav synth 0.1 sine 1000
}

# Function to generate a tone for a dash (-)
generate_dash() {
    sox -n -r 44100 -b 16 dash.wav synth 0.3 sine 1000
}

# Function to generate silence for spacing
generate_silence() {
    local duration=$1
    sox -n -r 44100 -b 16 silence.wav trim 0.0 $duration
}

# Generate basic sounds
generate_dot
generate_dash
generate_silence 0.1  # Short gap between parts of the same letter
generate_silence 0.3  # Medium gap between letters
generate_silence 0.7  # Long gap between words

# Convert text to Morse code
text_to_morse() {
    local text=$1
    local morse=""
    for (( i=0; i<${#text}; i++ )); do
        char=${text:$i:1}
        if [[ "$char" == " " ]]; then
            morse="$morse / "
        else
            morse="$morse ${morse_code[${char^^}]} "
        fi
    done
    echo $morse
}

# Combine sounds to form the Morse code audio
combine_sounds() {
    local morse=$1
    local output="morse_code.wav"
    rm -f combined.wav
    touch combined.wav
    for (( i=0; i<${#morse}; i++ )); do
        char=${morse:$i:1}
        case $char in
            ".")
                sox combined.wav dot.wav temp.wav
                mv temp.wav combined.wav
                ;;
            "-")
                sox combined.wav dash.wav temp.wav
                mv temp.wav combined.wav
                ;;
            " ")
                sox combined.wav silence.wav temp.wav
                mv temp.wav combined.wav
                ;;
            "/")
                sox combined.wav silence.wav temp.wav
                mv temp.wav combined.wav
                ;;
        esac
    done
    mv combined.wav $output
}

# Main function
main() {
    local text=$1
    local morse=$(text_to_morse "$text")
    echo "Morse Code: $morse"
    combine_sounds "$morse"
    echo "Morse code audio created as morse_code.wav"
}

# Usage
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 \"text to convert\""
    exit 1
fi

main "$1"

