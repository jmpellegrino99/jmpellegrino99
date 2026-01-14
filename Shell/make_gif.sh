read -p "Enter name of file: " input

ffmpeg -i $input -vf "fps=10,scale=320:-1:flags=lanczos" -c:v pam -f image2pipe - | convert -delay 10 - -loop 0 -layers Optimize output.gif
