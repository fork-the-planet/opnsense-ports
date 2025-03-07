PORTNAME=	erkale
DISTVERSION=	g20220405
PORTREVISION=	10
CATEGORIES=	science

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Quantum chemistry program to solve the electronic structure of atoms
WWW=		https://github.com/susilehtola/erkale

LICENSE=	GPLv2
LICENSE_FILE=	${WRKSRC}/COPYING

BROKEN_i386=	liberkale_omp.so.0.1.0: undefined reference to `__atomic_compare_exchange'

BUILD_DEPENDS=	armadillo>0:math/armadillo
LIB_DEPENDS=	libderiv.so:science/libint \
		libgsl.so:math/gsl \
		libhdf5.so:science/hdf5 \
		libint.so:science/libint \
		libsz.so:science/libaec \
		libxc.so:science/libxc
RUN_DEPENDS=	${LOCALBASE}/share/erkale/basis/6-21G.gbs:science/erkale-pseudopotentials

FLAVORS=	parallel serial
FLAVOR?=	${FLAVORS:[1]}
serial_PKGNAMESUFFIX=	-serial

USES=		cmake:noninja compiler:c11 fortran pkgconfig
USE_LDCONFIG=	yes
USE_CXXSTD=	c++14 # fix build with clang16 due to use of deprecated feature std::random_shuffle

USE_GITHUB=	yes
GH_ACCOUNT=	susilehtola
GH_TAGNAME=	f005a9ed588d7b6fcda54648db16523419308cbd

TEST_TARGET=	test

CMAKE_ON=	BUILD_SHARED_LIBS
CMAKE_ARGS=	-DERKALE_SYSTEM_LIBRARY=${DATADIR}/basis

PLIST_SUB=	SUFFIX="${SUFFIX}"

.if ${FLAVOR} == serial
CMAKE_OFF=	USE_OPENMP
.else # parallel
CMAKE_ON+=	USE_OPENMP
SUFFIX=		_omp
.  if !exists(/usr/include/omp.h)
BROKEN=		requires OpenMP support that is missing on this architecture
.  endif
.endif

OPTIONS_SINGLE=		LINALG
OPTIONS_SINGLE_LINALG=	NETLIB OPENBLAS
OPTIONS_DEFAULT=	OPENBLAS
LINALG_DESC=		Linear algebra library

NETLIB_USES=		blaslapack:netlib
NETLIB_CMAKE_ON=	-DLAPACK_LIBRARIES:STRING=-llapack -DBLAS_LIBRARIES:STRING=-lblas
NETLIB_LDFLAGS=		${LOCALBASE}/lib/libcblas.so ${LOCALBASE}/lib/liblapack.so ${LOCALBASE}/lib/libblas.so
NETLIB_LIB_DEPENDS=	libcblas.so:math/cblas
NETLIB_BROKEN=		choosing NETLIB causes a conflict: openblas-0.3.7_3,1 conflicts with cblas-1.0_12 on /usr/local/include/cblas.h

OPENBLAS_USES=		blaslapack:openblas
OPENBLAS_CMAKE_ON=	-DLAPACK_LIBRARIES:STRING=-lopenblas -DBLAS_LIBRARIES:STRING=-lopenblas

.if ${FLAVOR} == parallel
post-install:
	@${MV} ${STAGEDIR}${PREFIX}/include/erkale ${STAGEDIR}${PREFIX}/include/erkale${SUFFIX}
	@${MV} ${STAGEDIR}${PREFIX}/bin/erkale_bastool ${STAGEDIR}${PREFIX}/bin/erkale_bastool${SUFFIX}
.endif

.include <bsd.port.mk>
