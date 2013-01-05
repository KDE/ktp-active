/***************************************************************************
 *                                                                         *
 *   Copyright 2012 Artur Dębski <xmentero@gmail.com>                       *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA .        *
 ***************************************************************************/

// KDE
#include <KApplication>
#include <KAboutData>
#include <KCmdLineArgs>
#include <KDebug>
#include <KService>
#include <KConfigGroup>

// Own
#include "activeIM.h"

static const char description[] = I18N_NOOP("Instant Messenger for Plasma Active");

static const char version[] = "0.1";
//static const char HOME_URL[] = "http://community.kde.org/Plasma/Active";
static const char HOME_URL[] = "";

int main(int argc, char **argv)
{
    KAboutData about("ktp-active", 0, ki18n("Plasma Active Instant Messenger"), version, ki18n(description),
                     KAboutData::License_GPL, ki18n("Copyright 2012 Artur Dębski"), KLocalizedString(), 0, "xmentero@gmail.com");
                     about.addAuthor( ki18n("Artur Dębski"), KLocalizedString(), "xmentero@gmail.com" );
    KCmdLineArgs::init(argc, argv, &about);

    KCmdLineOptions options;

    KCmdLineArgs::addCmdLineOptions(options);
    KApplication app;

    KCmdLineArgs *args = KCmdLineArgs::parsedArgs();

    //use plasmarc to share this with plasma-windowed
    KConfigGroup cg(KSharedConfig::openConfig("plasmarc"), "General");
    bool useGL = cg.readEntry("UseOpenGl", true);
 

    ActiveIM *mainWindow = new ActiveIM();
    mainWindow->show();
    args->clear();
    return app.exec();
}
