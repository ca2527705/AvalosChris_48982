# This code depends on make tool being used
DEPFILES=$(wildcard $(addsuffix .d, ${OBJECTFILES}))
ifneq (${DEPFILES},)
DEPFILES=$(wildcard $(addsuffix .d, ${OBJECTFILES}))
include ${DEPFILES}
endif
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
