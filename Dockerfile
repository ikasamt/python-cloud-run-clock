FROM pypy:2.7-7.1.1

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV PORT 8080
EXPOSE 8080

CMD [ "gunicorn", "--workers=6", "app:application", "-b", "0.0.0.0:8080"]