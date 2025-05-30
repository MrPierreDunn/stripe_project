# Django Stripe Project

Проект на Django с интеграцией Stripe. Поддерживает запуск в Docker, переменные окружения и просмотр моделей через админку.


## 📦 Стек

- Python + Django
- PostgreSQL
- Stripe
- Docker / Docker Compose


## 🚀 Быстрый старт

### 1. Клонируйте репозиторий

```bash
git clone https://github.com/your-username/stripe_project.git
cd stripe_project
```

### 2. Создайте .env файл

```python
DEBUG=True
TEST_DATABASE=False
POSTGRES_DB=django
POSTGRES_USER=root
POSTGRES_PASSWORD=password
DB_HOST=db
DB_PORT=5432
ALLOWED_HOSTS=localhost,127.0.0.1
STRIPE_SECRET_KEY=sk_test_...
STRIPE_PUBLISHABLE_KEY=pk_test_...
```
```python
SECRET_KEY='secret key' # по дефолту задается временный секретный ключ, если не указывать его в .env
```

### 3. Запуск проекта
Используйте `makefile` для быстрого запуска

Билд образа и старт запуск контейнеров
```bash
make start
```
Создание и приминение миграций
```bash
make migrate
```
Создание суперпользователя
```bash
make createsuperuser
```

Дополнительные команды make файла можно посмотреть через команду с описанием
```bash
make help
```

## 📡 API

### 🔐 Админка
URL: `/admin/` \
Описание: Доступ к `панели администратора` Django. \

### 📄 Получить страницу товара
URL: `/item/{id}/` \
Метод: `GET` \
Описание: \
Возвращает HTML-страницу с информацией о товаре и кнопкой `Buy`. \
По нажатию на кнопку инициируется запрос к `/buy/{id}/` и редирект на `Stripe Checkout`.

### 💳 Купить товар
URL: `/buy/{id}/` \
Метод: `GET` \
Описание: \
Создаёт Stripe Checkout Session для оплаты товара с заданным id. \
Возвращает `session.id`, который используется Stripe JS SDK для редиректа пользователя на форму оплаты.