PORTNAME=	haproxyctl
PORTVERSION=	0.5
PORTREVISION=	2
DISTVERSIONPREFIX=	v
CATEGORIES=	net python
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	zhoutao@laocius.org
COMMENT=	HAProxy control tool
WWW=		https://github.com/neurogeek/haproxyctl

LICENSE=	GPLv3

TEST_DEPENDS=	${PYTHON_PKGNAMEPREFIX}nose>0:devel/py-nose@${PY_FLAVOR}

USES=		python
USE_PYTHON=	distutils concurrent autoplist

USE_GITHUB=	yes
GH_ACCOUNT=	neurogeek

NO_ARCH=	yes

do-test:
	@cd ${WRKSRC} && ${PYTHON_CMD} -m nose -v haproxy/tests

.include <bsd.port.mk>
