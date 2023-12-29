CFLAGS = -std=c++17 -O2
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

UNAME := $(shell uname -s)
ifeq ($(UNAME), Darwin)
# export VK_ICD_FILENAMES=lib/MoltenVK_icd.json
	LDFLAGS = -lglfw -ldl -lpthread -lvulkan
endif

VulkanTest: main.cc
	g++ $(CFLAGS) -o VulkanTest main.cc $(LDFLAGS)

.PHONY: test clean

test: VulkanTest
	./VulkanTest

clean:
	rm -f VulkanTest