# ==========================================
# TACTICAL DEPLOYMENT MAKEFILE
# OPERATIVE: CODENAMEBABA
# ==========================================

.PHONY: deploy

deploy:
	@echo ">> EXECUTING MAKEFILE COMMAND: DEPLOY"
	@echo ">> COMPILING CORE ARCHITECTURE..."
	@echo "gcc -Wall -Wextra -O3 -c legacy_routines.c -o obj/legacy_routines.o"
	@echo ""
	@echo ">> EXTRACTING ASSEMBLY INSTRUCTIONS..."
	@echo "gcc -S -masm=intel chaotic_core.c -o asm/chaotic_core.s"
	@echo "as -o obj/chaotic_core.o asm/chaotic_core.s"
	@echo ""
	@echo ">> WARNING: [-Warray-bounds] OVERRIDING MEMORY SAFEGUARDS IN 'chaotic_core.c'"
	@echo ">> LINKING FRAGMENTED PAYLOADS..."
	@echo "gcc obj/legacy_routines.o obj/chaotic_core.o -o bin/inventions_core"
	@echo ""
	@echo ">> [ OK ] COMPILATION SUCCESSFUL. NO CRITICAL FAILURES."
	@echo ">> ASSETS READY FOR TACTICAL INSERTION."
