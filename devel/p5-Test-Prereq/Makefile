PORTNAME=	Test-Prereq
PORTVERSION=	2.005
CATEGORIES=	devel perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	svysh.fbsd@gmail.com
COMMENT=	Check if Makefile.PL has the right pre-requisites
WWW=		https://github.com/briandfoy/test-prereq

LICENSE=	ART10 GPLv1+
LICENSE_COMB=	dual

BUILD_DEPENDS=	${RUN_DEPENDS}
RUN_DEPENDS=	p5-Module-Build>=0.4220:devel/p5-Module-Build \
		p5-Module-Extract-Use>0:devel/p5-Module-Extract-Use
TEST_DEPENDS=	p5-Test-Pod-Coverage>0:devel/p5-Test-Pod-Coverage \
		p5-Test-Pod>0:devel/p5-Test-Pod

USES=		perl5
USE_PERL5=	configure
NO_ARCH=	yes

.include <bsd.port.mk>
