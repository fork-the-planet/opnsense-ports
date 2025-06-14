PORTNAME=	tinyrpc
PORTVERSION=	1.1.7
CATEGORIES=	devel python
MASTER_SITES=	PYPI
PKGNAMEPREFIX=	${PYTHON_PKGNAMEPREFIX}

MAINTAINER=	sunpoet@FreeBSD.org
COMMENT=	Small, modular, transport and protocol neutral RPC library
WWW=		https://tinyrpc.readthedocs.io/en/latest/ \
		https://github.com/mbr/tinyrpc

LICENSE=	MIT
LICENSE_FILE=	${WRKSRC}/LICENSE

BUILD_DEPENDS=	${PYTHON_PKGNAMEPREFIX}setuptools>=0:devel/py-setuptools@${PY_FLAVOR} \
		${PYTHON_PKGNAMEPREFIX}wheel>=0:devel/py-wheel@${PY_FLAVOR}

USES=		python
USE_PYTHON=	autoplist concurrent pep517

NO_ARCH=	yes

OPTIONS_DEFINE=	GEVENT HTTPCLIENT MSGPACK RABBITMQ WEBSOCKET WSGI ZEROMQ
OPTIONS_DEFAULT=GEVENT HTTPCLIENT
GEVENT_DESC=	Gevent support
HTTPCLIENT_DESC=HTTP client support
MSGPACK_DESC=	MessagePack support
RABBITMQ_DESC=	RabbitMQ support
WSGI_DESC=	WSGI support
ZEROMQ_DESC=	ZeroMQ support

GEVENT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gevent>=0:devel/py-gevent@${PY_FLAVOR}
HTTPCLIENT_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gevent-websocket>=0:www/py-gevent-websocket@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}requests>=0:www/py-requests@${PY_FLAVOR} \
			${PYTHON_PKGNAMEPREFIX}websocket-client>=0:www/py-websocket-client@${PY_FLAVOR}
MSGPACK_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}msgpack>=0:devel/py-msgpack@${PY_FLAVOR}
RABBITMQ_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pika>=0:devel/py-pika@${PY_FLAVOR}
WEBSOCKET_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}gevent-websocket>=0:www/py-gevent-websocket@${PY_FLAVOR}
WSGI_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}werkzeug>=0:www/py-werkzeug@${PY_FLAVOR}
ZEROMQ_RUN_DEPENDS=	${PYTHON_PKGNAMEPREFIX}pyzmq>=0:net/py-pyzmq@${PY_FLAVOR}

.include <bsd.port.mk>
