# Acestream-engine-armv7-docker

Docker image to run acestream-engine on ARMv7.

Mostly a "docker" rework of [SshManko/acestream-armv7](https://github.com/sshmanko/acestream-armv7.git).

The docker image is a fake Android Filesystem where the Acestream Engine binaries from the APK are started.

Acestream for Android is developed using Python for Android.

## How to build the image

```
docker build acestream-armv7 .
```

## How to run

Privileged is required only because the binaries are for 32bit binaries and would require ```PER_LINUX32``` permission.

```
docker run --privileged -it --rm -p8621:8621 -p6878:6878 acestream-armv7
```

## How to open an Acestream ID on VLC

```
http://<ip>:6878/ace/getstream?id=<Acestream ID>&hlc=1&spv=0&transcode_audio=0&transcode_mp3=0&transcode_ac3=0&preferred_audio_language=eng
```

## How to run it on a x86 machine

```
docker run --rm --privileged hypriot/qemu-register
# then run normally
```
