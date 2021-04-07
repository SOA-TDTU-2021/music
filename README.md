## Clone project
```
git clone --recursive git@github.com:SOA-TDTU-2021/music.git
```

## Runs with Docker
```
docker-compose up
```

## Runs API
- Rename .env.example to .env and change varirables inside
```
cd api
python -m venv env
source env/bin/activate (Mac/Linux)
env\Scripts\activate (Windows)
pip install requirements.txt
python db_init.py
```

## Runs Frontend
```
npm install
npm run serve
```
