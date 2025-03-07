PORTNAME=	libnegf
DISTVERSIONPREFIX=	v
DISTVERSION=	1.1.3
PORTREVISION=	4
CATEGORIES=	science # chemistry

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Non Equilibrium Green's Functions library
WWW=		https://github.com/libnegf/libnegf

LICENSE=	GPLv3

.if !exists(/usr/include/omp.h)
BROKEN=		requires OpenMP support that is missing on this architecture
.endif

LIB_DEPENDS=	libmpi.so:net/mpich \
		libopenblas.so:math/openblas

USES=		cmake:testing fortran python:build
USE_GITHUB=	yes

CMAKE_ON=	BUILD_SHARED_LIBS

BINARY_ALIAS=	python=${PYTHON_CMD} python3=${PYTHON_CMD}

OPTIONS_DEFINE=		INELASTIC MPI
OPTIONS_DEFAULT=	MPI # MPI default has to be in sync with science/dftbplus

INELASTIC_DESC=		Build with inelastic scattering
INELASTIC_CMAKE_BOOL=	WITH_INELASTIC
INELASTIC_BROKEN=	Error: Can't open included file 'fftw3.f03', see https://github.com/libnegf/libnegf/issues/56

MPI_CMAKE_BOOL=		WITH_MPI
MPI_LIB_DEPENDS=	libmpifx.so:net/mpifx

.include <bsd.port.mk>
