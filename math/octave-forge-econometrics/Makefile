PORTNAME=	octave-forge-econometrics
PORTVERSION=	1.1.2
PORTREVISION=	7
CATEGORIES=	math
MASTER_SITES=	SF/octave/Octave%20Forge%20Packages/Individual%20Package%20Releases
DISTNAME=	${OCTAVE_PKGNAME}-${DISTVERSIONFULL}

MAINTAINER=	stephen@FreeBSD.org
COMMENT=	Octave-forge package ${OCTAVE_PKGNAME}
WWW=		https://packages.octave.org/

LICENSE=	GPLv3
LICENSE_FILE=	${WRKDIR}/${OCTAVE_SRC}/COPYING

BROKEN=		depends upon math/octave-forge-optim, which is broken

RUN_DEPENDS=	${OCTAVE_TARBALLS_DIR}/optim.tar.gz:math/octave-forge-optim

USES=		octave

.include <bsd.port.mk>
