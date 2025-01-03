#!/bin/bash

if [ "$3" == "" ]
then
        echo "usage: $0 <amount> <interest rate> <duration>"
        echo ""
        echo "e.g.: £50 at 5% for 10 years:"
        echo "      $0 50 0.05 10"
        exit
fi

PRINCIPAL=$1
RATE=$2
YEARS=$3

for YEAR in $(seq 1 $3)
        do
                AMOUNT=$(echo "$PRINCIPAL * (1 + $RATE)" | bc -l)
                PRINCIPAL=$AMOUNT
                printf "%4d | %.2f\n" $YEAR $AMOUNT
        done
