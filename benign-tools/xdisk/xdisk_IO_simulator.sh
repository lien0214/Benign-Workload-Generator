while true; do
    xdisk -C 100M -f ./testfile.txt -R -t 300 -M 4 -O D
    sleep 5
done