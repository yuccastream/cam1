# Пример реализации стриминга на сайт
Как это будет выглядеть: https://cam1.yuccastream.com/hls.html

## Зависимости
 - docker 
 - docker-compose

## Пример использования

По умолчанию настроенно на парковку вебки ноутбука

запуск
```bash
docker-compose up -d
```

остановка
```bash
docker-compose down -v
```

## Сборки ffmpeg в docker

- https://github.com/yuccastream/ffmpeg
- https://github.com/jrottenberg/ffmpeg


### Захват с USB

Что бы узнать `-input_format` и `-video_size` на входе:
```bash
ffmpeg -hide_banner -f video4linux2 -list_formats all -i /dev/video0
```

Что бы узнать `-framerate` на входе:
```bash
v4l2-ctl --list-formats-ext
```
