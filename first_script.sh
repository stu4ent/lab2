#!/bin/bash

# Перевірка наявності необхідних параметрів
if [ "$#" -ne 2 ]; then
    echo "Потрібно вказати шлях до каталогу та шлях до віддаленого репозиторію"
    exit 1
fi

# Перемінні для шляхів до каталогу та віддаленого репозиторію
directory="$1"
remote_repo="$2"

# Перевірка існування каталогу
if [ ! -d "$directory" ]; then
    echo "Каталог не існує: $directory"
    exit 1
fi

# Перевірка існування локального репозиторію
if [ ! -d "$directory/.git" ]; then
    echo "Локальний репозиторій не ініціалізовано: $directory"
    exit 1
fi

# Перевірка існування віддаленого репозиторію
git ls-remote "$remote_repo" &> /dev/null
if [ $? -ne 0 ]; then
    echo "Віддалений репозиторій не існує: $remote_repo"
    exit 1
fi

# Зв’язуємо локальний та віддалений репозиторії
git -C "$directory" remote add origin "$remote_repo" 2>/dev/null || echo "Remote origin already exists."

# Додаємо всі файли, що є у каталозі у локальний репозиторій
git -C "$directory" add .

# Створюємо коміт з назвою “Initial commit”
git -C "$directory" commit -m "Initial commit" || exit 1

# Виконуємо push на віддалений сервер
git -C "$directory" push -u origin main
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
