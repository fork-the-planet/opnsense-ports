PORTNAME=	langid
DISTVERSION=	1.1.6-20170715
PORTREVISION=	2
CATEGORIES=	textproc devel python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	thierry@FreeBSD.org
COMMENT=	Standalone Language Identification (LangID) tool
WWW=		https://github.com/saffsd/langid.py

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYNUMPY}
RUN_DEPENDS=	${PYNUMPY}

USE_GITHUB=	yes
GH_ACCOUNT=	saffsd
GH_PROJECT=	${PORTNAME}.py
GH_TAGNAME=	4153583

USES=		python shebangfix
USE_PYTHON=	distutils
SHEBANG_GLOB=	*.py

NO_ARCH=	yes

post-extract:
	${MKDIR} ${WRKDIR}/unsupported-Python-2.7
	${MV} ${WRKSRC}/langid/train ${WRKDIR}/unsupported-Python-2.7

.include <bsd.port.mk>
