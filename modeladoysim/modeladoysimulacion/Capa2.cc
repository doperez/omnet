#include <stdio.h>
#include <string.h>
#include <omnetpp.h>

using namespace omnetpp;

class Capa2 : public cSimpleModule
{
  protected:
    virtual void forwardMessage(cMessage *msg);
    virtual void initialize() override;
    virtual void handleMessage(cMessage *msg) override;
};

Define_Module(Capa2);

void Capa2::initialize()
{
    if (getIndex() == 0) {
        char msgname[20];
        sprintf(msgname, "sw-%d", getIndex());
        cMessage *msg = new cMessage(msgname);
        scheduleAt(0.0, msg);
    }
}

void Capa2::handleMessage(cMessage *msg)
{
    if (getIndex() == 5) {
        EV << "Message " << msg << " arrived.\n";
        delete msg;
    }
    else {
        forwardMessage(msg);
    }
}

void Capa2::forwardMessage(cMessage *msg)
{
    int n = gateSize("out");
    int k = intuniform(0, n-1);

    EV << "Forwarding message " << msg << " on port out[" << k << "]\n";
    send(msg, "out", k);
}
