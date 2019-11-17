#!/bin/sh
for i in *.wkt; 
	do mkdir ./${i%.*}/; mv ${i%.*}.wkt ${i%.*}/${i%.*}.wkt; 
done
