/***************************************************************************
 *                                                                         *
 *   Copyright 2012 Artur Dębski <sebas@kde.org>                       *
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

#include "activeIM.h"
#include "kdeclarativeview.h"

#include <QDeclarativeContext>
#include <QFileInfo>

#include <KAction>
#include <KCmdLineArgs>
#include <KConfigGroup>
#include <KIcon>
#include <KStandardAction>
#include <KStandardDirs>
#include <KServiceTypeTrader>
#include <KMimeType>

#include <kio/copyjob.h>
#include <Plasma/Theme>


ActiveIM::ActiveIM()
    : KDeclarativeMainWindow()
{
    //KCmdLineArgs *args = KCmdLineArgs::parsedArgs();

    declarativeView()->setPackageName("org.kde.ktp.active");
   
}

ActiveIM::~ActiveIM()
{
}

#include "activeIM.moc"
