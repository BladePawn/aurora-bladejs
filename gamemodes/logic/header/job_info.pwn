enum
{
    INFOBAR_JOB_ZAVOD = 1,
    INFOBAR_WORK_OIL = 2
}

stock ShowJobInfoTD(playerid, type) {
	if (!GetPVarInt(playerid, "jobInfoBarShowed")) {
		InformationPTD[playerid][0] = CreatePlayerTextDraw(playerid, 24.2 + 482.0/*27.122541*/, 220.333328, " ");
		PlayerTextDrawLetterSize(playerid, InformationPTD[playerid][0], 0.230863, 1.005000);
		PlayerTextDrawTextSize(playerid, InformationPTD[playerid][0], 151.000000 + 482.0, 0.000000);
		PlayerTextDrawAlignment(playerid, InformationPTD[playerid][0], 1);
		PlayerTextDrawColor(playerid, InformationPTD[playerid][0], -1);
		PlayerTextDrawSetShadow(playerid, InformationPTD[playerid][0], 0);
		PlayerTextDrawBackgroundColor(playerid, InformationPTD[playerid][0], 255);
		PlayerTextDrawFont(playerid, InformationPTD[playerid][0], 1);
		PlayerTextDrawSetProportional(playerid, InformationPTD[playerid][0], 1);

		InformationPTD[playerid][1] = CreatePlayerTextDraw(playerid, 120.000000 + 482.0, 220.333328, " ");
		PlayerTextDrawLetterSize(playerid, InformationPTD[playerid][1], 0.230863, 1.005000);
		PlayerTextDrawTextSize(playerid, InformationPTD[playerid][1], 243.877868 + 482.0, 0.000000);
		PlayerTextDrawAlignment(playerid, InformationPTD[playerid][1], 3);
		PlayerTextDrawColor(playerid, InformationPTD[playerid][1], -1);
		PlayerTextDrawSetShadow(playerid, InformationPTD[playerid][1], 0);
		PlayerTextDrawBackgroundColor(playerid, InformationPTD[playerid][1], 255);
		PlayerTextDrawFont(playerid, InformationPTD[playerid][1], 1);
		PlayerTextDrawSetProportional(playerid, InformationPTD[playerid][1], 1);

		InformationPTD[playerid][2] = CreatePlayerTextDraw(playerid, 24.2 + 482.0/*27.122541*/, 222.950195, " ");
		PlayerTextDrawLetterSize(playerid, InformationPTD[playerid][2], 0.244450, 1.133333);
		PlayerTextDrawTextSize(playerid, InformationPTD[playerid][2], 151.000000 + 482.0, 0.000000);
		PlayerTextDrawAlignment(playerid, InformationPTD[playerid][2], 1);
		PlayerTextDrawColor(playerid, InformationPTD[playerid][2], -1);
		PlayerTextDrawSetShadow(playerid, InformationPTD[playerid][2], 0);
		PlayerTextDrawBackgroundColor(playerid, InformationPTD[playerid][2], 255);
		PlayerTextDrawFont(playerid, InformationPTD[playerid][2], 1);
		PlayerTextDrawSetProportional(playerid, InformationPTD[playerid][2], 1);
	}
	SetPVarInt(playerid, "jobInfoBarShowed", 1);
	SetPVarInt(playerid, "jobInfoBarType", type);

	UpdateJobInfoTD(playerid);

	for (new td_id = 0; td_id < sizeof(InformationTD); td_id++)
		TextDrawShowForPlayer ( playerid , InformationTD [ td_id ] ) ;
	for (new ptd_id = 0; ptd_id < 3; ptd_id++)
		PlayerTextDrawShow ( playerid , InformationPTD [ playerid ] [ ptd_id ] ) ;


	return true;
}

stock UpdateJobInfoTD(playerid) {
	if (!GetPVarInt(playerid, "jobInfoBarShowed"))
		return;
	new type = GetPVarInt(playerid, "jobInfoBarType");

	switch (type) {
        case INFOBAR_JOB_ZAVOD:{ //Оружейный завод
			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL), "MONEY:_~g~~h~$%d", TI[playerid][tJobSalary]);
			PlayerTextDrawSetString ( playerid, InformationPTD [ playerid ] [ 0 ] , COMMAND_GLOBAL ) , COMMAND_GLOBAL[0] = EOS;
        }
        case INFOBAR_WORK_OIL:{ //Нафтан
            format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL), "MONEY:_~g~~h~$%d", TI[playerid][tJobSalary]);
		    PlayerTextDrawSetString ( playerid, InformationPTD [ playerid ] [ 0 ] , COMMAND_GLOBAL ) , COMMAND_GLOBAL[0] = EOS;
        }
		/*case INFOBAR_ID_FARM_JOB_1: { // косарь
			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"AMOUNT:~y~%i~n~\
				~w~~h~PLANTED: ~r~~h~~h~~h~%i~n~\
				~w~~h~EARNED: ~g~~h~$%i",
				FarmJob_PI[playerid][farmPlantsAmount],
				FarmJob_PI[playerid][farmPlantedAmount],
				FarmJob_PI[playerid][farmJobCollected] * PAYDAY_FARM_JOB_1
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][0], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;

			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"WATER:~b~~h~~h~~h~%i/50",
				FarmJob_PI[playerid][farmWaterAmount]
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][1], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;

			PlayerTextDrawSetString(playerid, InformationPTD[playerid][2], " ");
		}
		case INFOBAR_ID_FARM_JOB_2: { // доярка
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][0], " ");
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][1], " ");

			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"~w~~h~MILKED: ~r~~h~~h~~h~%i~n~\
				~w~~h~EARNED: ~g~~h~$%i",
				FarmJob_PI[playerid][farmJobCollected],
				FarmJob_PI[playerid][farmJobCollected] * PAYDAY_FARM_JOB_2
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][2], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;
		}
		case INFOBAR_ID_FARM_JOB_3: { // экспедитоар
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][0], " ");
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][1], " ");

			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"~w~~h~AMOUNT: ~r~~h~~h~~h~%i~n~\
				~w~~h~EARNED: ~g~~h~$%i",
				FarmJob_PI[playerid][farmJobCollected],
				FarmJob_PI[playerid][farmJobCollected] * PAYDAY_FARM_JOB_3
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][2], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;
		}
		case INFOBAR_ID_FACTORY_JOB_1: { // экспедитоар
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][0], " ");
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][1], " ");

			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"~w~~h~AMOUNT: ~r~~h~~h~~h~%i~n~\
				~w~~h~EARNED: ~g~~h~$%i",
				FactoryJob_PI[playerid][factoryJobCollected],
				FactoryJob_PI[playerid][factoryJobCollected] * PAYDAY_FACTORY_JOB_1
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][2], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;
		}
		case INFOBAR_ID_FACTORY_JOB_2: { // экспедитоар
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][0], " ");
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][1], " ");

			format(COMMAND_GLOBAL, sizeof(COMMAND_GLOBAL),
				"~w~~h~AMOUNT: ~r~~h~~h~~h~%i~n~\
				~w~~h~EARNED: ~g~~h~$%i",
				FactoryJob_PI[playerid][factoryJobCollected],
				FactoryJob_PI[playerid][factoryJobCollected] * PAYDAY_FACTORY_JOB_2
			);
			PlayerTextDrawSetString(playerid, InformationPTD[playerid][2], COMMAND_GLOBAL), COMMAND_GLOBAL[0] = EOS;
		}*/
	}
}

stock HideWorkInfoTD( playerid )
{
	for (new td_id = 0; td_id < sizeof(InformationTD); td_id++)
		TextDrawHideForPlayer(playerid, InformationTD[td_id]);
	for (new ptd_id = 0; ptd_id < 3; ptd_id++)
		PlayerTextDrawHide(playerid, InformationPTD[playerid][ptd_id]);
	return true;
}