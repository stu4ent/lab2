#!/bin/bash

# Перевірка наявності необхідних параметрів
if [ "$#" -ne 2 ]; then
    echo "Потрібно вказати шлях до каталогу та шлях до віддаленого репозиторію"
    exit 1
fi

# Перемінні для шляхів до каталогу та віддаленого репозиторію
directory="$1"
remote_repo="$2"

# Ініціалізуємо локальний репозиторій
git init "$directory"

# Зв’язуємо локальний та віддалений репозиторії
git -C "$directory" remote add origin "$remote_repo"

# Додаємо всі файли, що є у каталозі у локальний репозиторій
git -C "$directory" add .

# Створюємо коміт з назвою “Initial commit”
git -C "$directory" commit -m "Initial commit"

# Виконуємо push на віддалений сервер
git -C "$directory" push -u origin master

