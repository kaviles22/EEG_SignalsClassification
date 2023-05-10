% Clear the workspace and the screen
sca;
close all;
clearvars;
Screen('Preference', 'SkipSyncTests', 1);
% Here we call some default settings for setting up Psychtoolbox
PsychDefaultSetup(2);

% Get the screen numbers
%screens = Screen('Screens');
%screenNumber = max(screens);
% Draw to the external screen if avaliable
screenNumber = 1;

%Definir activekeys
 KbName('UnifyKeyNames');
 activeKeys = [KbName('LeftArrow') KbName('RightArrow')];
 RestrictKeysForKbCheck(activeKeys);
 ListenChar(2);
 %tStart = GetSecs;
 timedout = false;
 
% Define black and white
white = WhiteIndex(screenNumber);
black = BlackIndex(screenNumber);
grey = white / 2;
rectColorCircle1 = [0 0 0];
% Open an on screen window
[window, windowRect] = PsychImaging('OpenWindow', screenNumber, black);

% Measure the vertical refresh rate of the monitor
ifi = Screen('GetFlipInterval', window);

% Set up alpha-blending for smooth (anti-aliased) lines
Screen('BlendFunction', window, 'GL_SRC_ALPHA', 'GL_ONE_MINUS_SRC_ALPHA');

% Setup the text type for the window
Screen('TextFont', window, 'Ariel');
Screen('TextSize', window, 36);
DrawFormattedText(window, 'Bienvenido presiona --> para empezar', 'center', 'center', white);

% Here we set the size of the arms of our fixation cross
fixCrossDimPix = 30;

% Now we set the coordinates (these are all relative to zero we will let
% the drawing routine center the cross in the center of our monitor for us)
xCoords = [-fixCrossDimPix fixCrossDimPix 0 0];
yCoords = [0 0 -fixCrossDimPix fixCrossDimPix];
allCoords = [xCoords; yCoords];

% Set the line width for our fixation cross
lineWidthPix = 6.9;

% Retreive the maximum priority number
topPriorityLevel = MaxPriority(window);

% Length of time and number of frames we will use for each drawing test
numSecs = 1;
numFrames = round(numSecs / ifi);
waitframes = 1;

[screenXpixels, screenYpixels] = Screen('WindowSize', window);
[xCenter, yCenter] = RectCenter(windowRect);
baseRectCircle1 = [0 0 140 140];
baseRectCircle = [0 0 150 150];
baseRect1 = [0 0 90 90];
baseRect = [0 0 100 100];
% For Ovals we set a miximum diameter up to which it is perfect for
maxDiameter = max(baseRect) * 1.01;
maxDiameter1 = max(baseRect1);
% Center the rectangle on the centre of the screen
centeredRect = CenterRectOnPointd(baseRectCircle, xCenter, yCenter);
centeredRect1 = CenterRectOnPointd(baseRectCircle1, xCenter, yCenter);
rectColorCircle = [1 1 1];

% Screen X positions of our three rectangles
squareXpos = [screenXpixels * 0.2 screenXpixels * 0.4 screenXpixels * 0.6 screenXpixels * 0.8];
numSqaures = length(squareXpos);

% Set the colors to Red, Green, Blue and Purple
allColors = [1 1 1; 1 1 1; 1 1 1; 1 1 1];

% Make our rectangle coordinates
global allRects;
allRects = nan(4, 4);
Priority(topPriorityLevel);
vbl = Screen('Flip', window);

allRects(:, 1) = CenterRectOnPointd(baseRect, xCenter, yCenter*0.2);
allRects(:, 2) = CenterRectOnPointd(baseRect, xCenter*0.3, yCenter);
allRects(:, 3) = CenterRectOnPointd(baseRect, xCenter*1.7, yCenter);
allRects(:, 4) = CenterRectOnPointd(baseRect, xCenter, yCenter*1.8);

%Definir numero de veces que se repetir� el loop
vueltas = 40;

%Mostrar baseline (pantalla negra)
Screen('FillRect', window, [0 0 0])


while ~timedout
    % check if a key is pressed
    % only keys specified in activeKeys are considered valid
    [keyIsDown, keyTime, keyCode] = KbCheck; 
     if(keyIsDown),break; end
end
%crear un reloj
tic;
time = 0;
while clock==1
 time = time + 1;
end
toc;
rectColorRojo = [1 1 1; 0 0 0; 0.2 0.2 0.2];
rectColorVerde = [1 1 1; 0 0 0; 0.2 0.2 0.2];
rectColorAzul = [1 1 1; 0 0 0; 0.2 0.2 0.2];
rectColorMorado = [1 1 1; 0 0 0; 0.2 0.2 0.2];
%%Setting the frequency of each square
frecuencias = [9 7 6 5 4];
base = 300;
indices = [1 2 3 4];
indices_rand = indices(randperm(length(indices)));
import java.awt.Robot;
import java.awt.event.*;
robot = Robot();
for vuelta = 1:vueltas 
    for escena = 0:4;
        if escena == 0
            robot.keyPress(KeyEvent.VK_T);  %Baseline
        elseif indices_rand(1) == 1         
            robot.keyPress(KeyEvent.VK_Q);  %Rojo
        elseif indices_rand(1) == 2
            robot.keyPress(KeyEvent.VK_W);  %Azul
        elseif indices_rand(1) == 3
            robot.keyPress(KeyEvent.VK_E);  %Verde 
        elseif indices_rand(1) == 4
            robot.keyPress(KeyEvent.VK_R);  %Morado
        end
        for frame = 1:211;
            if escena == 0 
                
                Screen('FillRect', window, [0 0 0]);
                Screen('FillOval', window, rectColorCircle, centeredRect, maxDiameter);
                Screen('FillOval', window, rectColorCircle1, centeredRect1, maxDiameter1);
                Screen('DrawLines', window, allCoords,lineWidthPix, rectColorCircle, [xCenter yCenter], 2);
            elseif indices_rand(1) == 1
                
                Screen('FillRect', window, rectColorAzul(3, :), allRects(:,2));
                Screen('FillRect', window, rectColorVerde(3, :), allRects(:,3));
                Screen('FillRect', window, rectColorMorado(3, :), allRects(:,4));
            
                if mod(frame, frecuencias(indices_rand(1)))==0
                encendido = not(encendido);
                end
                if encendido
                    Screen('FillRect', window, rectColorRojo(1, :), allRects(:,1));
                else
                    Screen('FillRect', window, rectColorRojo(2, :), allRects(:,1));
                end
                
            elseif indices_rand(1) == 2
                
                Screen('FillRect', window, rectColorRojo(3, :), allRects(:,1));
                Screen('FillRect', window, rectColorVerde(3, :), allRects(:,3));
                Screen('FillRect', window, rectColorMorado(3, :), allRects(:,4));
            
                if mod(frame, frecuencias(indices_rand(1)))==0
                    encendido = not(encendido);
                end
                if encendido
                    Screen('FillRect', window, rectColorAzul(1, :), allRects(:,2));
                else
                    Screen('FillRect', window, rectColorAzul(2, :), allRects(:,2));
                end
                
            elseif indices_rand(1) == 3
                
                Screen('FillRect', window, rectColorRojo(3, :), allRects(:,1));
                Screen('FillRect', window, rectColorAzul(3, :), allRects(:,2));
                Screen('FillRect', window, rectColorMorado(3, :), allRects(:,4));
                
                if mod(frame, frecuencias(indices_rand(1)))==0
                    encendido = not(encendido);
                end
                if encendido
                    Screen('FillRect', window, rectColorVerde(1, :), allRects(:,3));
                else
                    Screen('FillRect', window, rectColorVerde(2, :), allRects(:,3));
                end
                
            elseif indices_rand(1) == 4
                
                Screen('FillRect', window, rectColorRojo(3, :), allRects(:,1));
                Screen('FillRect', window, rectColorAzul(3, :), allRects(:,2));
                Screen('FillRect', window, rectColorVerde(3, :), allRects(:,3));
                
                if mod(frame, frecuencias(indices_rand(1)))==0
                    encendido = not(encendido);
                end
                if encendido
                    Screen('FillRect', window, rectColorMorado(1, :), allRects(:,4));
                else
                    Screen('FillRect', window, rectColorMorado(2, :), allRects(:,4));
                end
            end 
       
        Screen('DrawingFinished', window);
        vbl = Screen('Flip', window, vbl + (waitframes - 0.5) * ifi);
        end
        encendido = true;
        indices_rand = circshift(indices_rand, 1);
    end
    
    
end
Priority(0);
Screen('TextFont', window, 'Ariel');
Screen('TextSize', window, 126);
DrawFormattedText(window, 'Gracias', 'center', 'center', white);
Screen('Flip', window);

KbStrokeWait;
Screen('CloseAll')
sca;
close all;
clearvars;