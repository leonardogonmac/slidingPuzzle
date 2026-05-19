.PHONY: main samples

main:
	mkdir -p ./bin
	g++ slidingPuzzle.cpp -o ./bin/bin

samples:
	mkdir -p samples/$(DIST)
	for i in $$(seq -w 1 9); do \
		echo "$(DIST)" | ./bin/bin > samples/$(DIST)/0$$i; \
		sleep 1; \
	done
	echo "$(DIST)" | ./bin/bin > samples/$(DIST)/10

MEMORY_GB ?= 2

test:
	for s in samples/$(DIST)/*; do \
		echo "=============================="; \
		echo "Running: $$s"; \
		LIMIT_BYTES=$$(( $(MEMORY_GB) * 1024 * 1024 * 1024 )); \
		if /usr/bin/time -f "Elapsed: %E\nCPU: %P\nMax memory: %M KB" \
			prlimit --as=$$LIMIT_BYTES ./bin/bin $(THREAD_NUM) < $$s > /dev/null; \
		then \
			echo "OK: $$s"; \
		else \
			echo "Skipped/failed due to memory limit or runtime error: $$s"; \
		fi; \
	done

multithread_tests:
	mkdir -p tests_report/multithread
	for i in $$(seq 3 5); do \
		make test DIST=$$i THREAD_NUM=8 > tests_report/multithread/$$i 2>&1; \
	done