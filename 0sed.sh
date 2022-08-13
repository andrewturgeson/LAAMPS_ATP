#!/bin/bash

for i in {2..5}; do
sed "s/set restart 1/set restart ${i}/g" equ1.conf > equ${i}.conf
done
