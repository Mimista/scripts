#!/bin/bash
diff <(cat output.txt) <(service --status-all | grep + -C 0) >> output.txt

