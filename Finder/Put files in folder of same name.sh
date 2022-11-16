#!/bin/sh
for i in *; 
	do mkdir ./${i%.*}/; mv $i ${i%.*}/$i; 
done
