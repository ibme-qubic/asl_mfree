include ${FSLCONFDIR}/default.mk

PROJNAME = asl_mfree

USRINCFLAGS = -I${INC_NEWMAT} -I${INC_ZLIB}
USRLDFLAGS = -L${LIB_NEWMAT} -L${LIB_ZLIB}

LIBS = -lutils -lnewimage -lmiscmaths -lm -lnewmat -lfslio -lniftiio -lprob -lznz -lz

XFILES = asl_mfree

OBJS = readoptions.o asl_mfree_functions.o

# Pass Git revision details
GIT_VERSION:=$(shell git describe --dirty)
GIT_DATE:=$(shell git log -1 --format=%ad --date=local)
CXXFLAGS += -DGIT_VERSION=\"${GIT_VERSION}\" -DGIT_DATE="\"${GIT_DATE}\""

all:	${XFILES}

asl_mfree: ${OBJS} asl_mfree.o 
	${CXX}  ${CXXFLAGS} ${LDFLAGS} -o $@ ${OBJS} asl_mfree.o ${LIBS}
