import psycopg2
import pandas as pd
import matplotlib.pyplot as plt

# Подключение к PostgreSQL
conn = psycopg2.connect(
    dbname="students_db",
    user="dv_user",
    password="StrongPassword123",
    host="localhost",
    port="5432"
)

# Загружаем данные из таблицы
query = "SELECT * FROM students_raw;"
df = pd.read_sql(query, conn)

print("✅ Первые строки данных:")
print(df.head())

# Пример анализа — средний балл по полу
avg_scores = df.groupby("gender")[["math_score", "reading_score", "writing_score"]].mean()
print("\nСредние оценки по полу:")
print(avg_scores)

# Визуализация
avg_scores.plot(kind="bar", figsize=(8, 5))
plt.title("Средние оценки по полу")
plt.ylabel("Балл")
plt.xlabel("Пол")
plt.tight_layout()
plt.show()

# Закрываем соединение
conn.close()
