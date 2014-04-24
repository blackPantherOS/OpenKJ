/*
 * Copyright (c) 2013-2014 Thomas Isaac Lightburn
 *
 *
 * This file is part of OpenKJ.
 *
 * OpenKJ is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#ifndef KHAUDIOBACKENDFMOD_H
#define KHAUDIOBACKENDFMOD_H

#include <khabstractaudiobackend.h>
#include <fmod.hpp>
#include <fmod_errors.h>
#include <QTimer>

using namespace FMOD;

class KhAudioBackendFMOD : public KhAbstractAudioBackend
{
    Q_OBJECT
private:
    int m_pitchShift;
    bool m_pitchShifterEnabled;
    int m_volume;
    bool m_soundOpened;
    FMOD::System *system;
    FMOD::Sound      *sound;
    FMOD::Channel    *channel;
    FMOD_RESULT      fmresult;
    FMOD::DSP        *dsp;
    FMOD_CREATESOUNDEXINFO exinfo;
    double GetKeyFloat(int keychange);
    QTimer *signalTimer;
    void pitchShifter(bool enable);

public:
    explicit KhAudioBackendFMOD(QObject *parent = 0);
    QString backendName() {return QString("FMOD");}
signals:

public slots:




    // KhAbstractAudioBackend interface
public:
    int volume();
    qint64 position();
    bool isMuted();
    qint64 duration();
    QMediaPlayer::State state();
    bool canPitchShift();
    int pitchShift();
    bool canDetectSilence() { return true; }
    bool isSilent();

public slots:
    void play();
    void pause();
    void setMedia(QString filename);
    void setMuted(bool muted);
    void setPosition(qint64 position);
    void setVolume(int volume);
    void stop();
    void setPitchShift(int semitones);

private slots:
    void signalTimer_timeout();
};

#endif // KHAUDIOBACKENDFMOD_H
