PORTNAME=	tree-format
PORTVERSION=	0.1.2
PORTREVISION=	1
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	matthew@FreeBSD.org
COMMENT=	Generate nicely formatted trees
WWW=		https://pypi.org/project/tree-format/

LICENSE=	APACHE20

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}testtools>0:devel/py-testtools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}pytest>0:devel/py-pytest@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent distutils

NO_ARCH=	yes

do-test:
	cd ${WRKSRC} && \
	${PYTHON_CMD} setup.py --version && \
	${PYTHON_CMD} -m unittest discover tree_format.tests

.include <bsd.port.mk>
