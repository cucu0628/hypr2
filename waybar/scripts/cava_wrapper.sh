# Olvasd be a cava FIFO sorát
read -r line < "$FIFO"

# Vágd az első 10 értékre (tetszőleges szám lehet, 8–20 között általában jó)
bars=$(echo "$line" | awk '{for(i=1;i<=10;i++) printf "%s ", $i}' | sed 's/[0-9][0-9]*/█/g')

# Térj vissza JSON szöveggel
echo "{\"text\": \"$bars\"}"

