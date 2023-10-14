#!/bin/bash

touch $(date +"%d_%m_%Y_%H_%M_%S.status")
./collect.sh >> $(date +"%d_%m_%Y_%H_%M_%S.status")
echo "saved"