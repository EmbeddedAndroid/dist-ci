# Copyright (C) 2018 Open Source Foundries
# Author: Andy Doan <andy@opensourcefoundries.com>

from dist_ci.ui.auth import blueprint as auth_bp
from dist_ci.ui.jobserv import blueprint as jobserv_bp
from dist_ci.ui.settings import blueprint as settings_bp

BLUEPRINTS = (
    auth_bp,
    jobserv_bp,
    settings_bp,
)


def register_blueprints(app):
    for bp in BLUEPRINTS:
        app.register_blueprint(bp)
