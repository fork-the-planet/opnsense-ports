PORTNAME=	svgwrite
PORTVERSION=	1.4.3
PORTREVISION=	1
CATEGORIES=	graphics python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	george@m5p.com
COMMENT=	Python library to create SVG drawings
WWW=		https://github.com/mozman/svgwrite

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE.TXT

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

USES=		python zip
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

PORTEXAMPLES=	*
OPTIONS_DEFINE=	EXAMPLES

post-install-EXAMPLES-on:
	@${MKDIR} ${STAGEDIR}${EXAMPLESDIR}
	@(cd ${WRKSRC}/examples/ && ${COPYTREE_SHARE} . ${STAGEDIR}${EXAMPLESDIR})

do-test:
	@cd ${WRKSRC} && ${SETENV} ${TEST_ENV} ${PYTHON_CMD} -m pytest -v -rs

.include <bsd.port.mk>
