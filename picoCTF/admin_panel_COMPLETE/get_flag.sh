#!/bin/bash

strings data.pcap | grep -oE "picoCTF{.*}" --color=none

