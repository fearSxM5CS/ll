

#!/bin/bash

if [ -d "\$1" ]; then
    for file in "\$1"/*; do
        if [ -f "$file" ]; then
            owner=$(stat -c '%U' "$file")
            mkdir -p "\$1/$owner"
            cp "$file" "\$1/$owner/"
        fi
    done
    echo "Файлы скопированы в директории, названные по имени владельца"
else
    echo "Ошибка: директория \$1 не существует"
fi
