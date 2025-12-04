# Makefile for setting up virtual environment, installing dependencies,
# running tests, building and cleaning the project
.PHONY: venv freeze install test build clean help

# Создание виртуального окружения
venv:
	python3 -m venv .venv

# Заморозка текущих зависимостей в requirements.txt
freeze:
	. .venv/bin/activate && pip3 freeze > requirements.txt

# Установка зависимостей из requirements.txt
install:
	. .venv/bin/activate && pip3 install -r requirements.txt

# Тестирование проекта с использованием pytest
test:
	# Это позволит установить ваш пакет в режиме разработки, благодаря чему
	# тесты смогут находить ваши модули.
	. .venv/bin/activate && pip3 install -e .
	# Запуск тестов с помощью pytest
	. .venv/bin/activate && pytest -v tests/

# Очистка сгенерированных файлов сборки и виртуального окружения
clean:
	rm -rf build dist *.egg-info .venv __pycache__ */__pycache__ */*/__pycache__

# Сборка проекта в дистрибутивы (sdist и wheel)
build:
	. .venv/bin/activate && python3 -m build
