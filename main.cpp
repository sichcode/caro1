#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "carocontroller.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    CaroController controller;

    QQmlApplicationEngine engine;
    
    engine.rootContext()->setContextProperty("caroController", &controller);
    
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
