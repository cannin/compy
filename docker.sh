#!/bin/sh
exec compy -cert $CRT_FILE -key $KEY_FILE -ca $CRT_FILE -cakey $KEY_FILE
