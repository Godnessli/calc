#ifndef CALCULATION_H
#define CALCULATION_H

#include <QObject>

class Calculation : public QObject
{
    Q_OBJECT
public:
    explicit Calculation(QObject *parent = nullptr);

signals:
};

#endif // CALCULATION_H
