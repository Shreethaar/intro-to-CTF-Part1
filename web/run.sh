#! /bin/bash

python3 chall-1/app.py &
python3 chall-2/app.py &
(cd chall-3 && ./run.sh) &
python3 chall-4/app.py

