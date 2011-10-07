/*=====================================================================

MAVCONN Micro Air Vehicle Flying Robotics Toolkit
Please see our website at <http://MAVCONN.ethz.ch>

(c) 2009, 2010 MAVCONN PROJECT

This file is part of the MAVCONN project

    MAVCONN is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    MAVCONN is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with MAVCONN. If not, see <http://www.gnu.org/licenses/>.

======================================================================*/

/**
 * @file
 *   @brief LCM example
 *
 *   @author Lorenz Meier <mavteam@student.ethz.ch>
 *
 */

#include <cstdio>
#include <unistd.h>
#include <glib.h>
#include "mavconn.h"

// Latency Benchmarking
#include <sys/time.h>
#include <time.h>

// Timer for benchmarking
struct timeval tv;

const int compid = 111;

static void
mavlink_handler (const lcm_recv_buf_t *rbuf, const char * channel,
		const mavconn_mavlink_msg_container_t* container, void * user)
{
	const mavlink_message_t* msg = getMAVLinkMsgPtr(container);
	mavlink_message_t response;
	lcm_t* lcm = static_cast<lcm_t*>(user);
	printf("Received message #%d on channel \"%s\" (sys:%d|comp:%d):\n", msg->msgid, channel, msg->sysid, msg->compid);

	switch(msg->msgid)
	{
	uint32_t receiveTime;
	uint32_t sendTime;
	case MAVLINK_MSG_ID_COMMAND_SHORT:
	{
		mavlink_command_short_t cmd;
		mavlink_msg_command_short_decode(msg, &cmd);
		printf("Message ID: %d\n", msg->msgid);
		printf("Command ID: %d\n", cmd.command);
		printf("Target System ID: %d\n", cmd.target_system);
		printf("Target Component ID: %d\n", cmd.target_component);
		printf("\n");

		if (cmd.confirmation)
		{
			printf("Confirmation requested, sending confirmation:\n");
			mavlink_command_ack_t ack;
			ack.command = cmd.command;
			ack.result = 3;
			mavlink_msg_command_ack_encode(getSystemID(), compid, &response, &ack);
			sendMAVLinkMessage(lcm, &response);
		}
	}
		break;
	case MAVLINK_MSG_ID_ATTITUDE:
		gettimeofday(&tv, NULL);
		receiveTime = tv.tv_usec;
		sendTime = mavlink_msg_attitude_get_time_boot_ms(msg);
		printf("Received attitude message, transport took %f ms\n", (receiveTime - sendTime)/1000.0f);
		break;
	case MAVLINK_MSG_ID_GPS_RAW_INT:
	{
		mavlink_gps_raw_int_t gps;
		mavlink_msg_gps_raw_int_decode(msg, &gps);
		printf("GPS: lat: %f, lon: %f, alt: %f\n", gps.lat/(double)1E7, gps.lon/(double)1E7, gps.alt/(double)1E6);
		break;
	}
	case MAVLINK_MSG_ID_RAW_PRESSURE:
	{
		mavlink_raw_pressure_t p;
		mavlink_msg_raw_pressure_decode(msg, &p);
		printf("PRES: %f\n", p.press_abs/(double)1000);
	}
	break;
	default:
		printf("ERROR: could not decode message with ID: %d\n", msg->msgid);
		break;
	}
}


void* lcm_wait(void* lcm_ptr)
		{
	lcm_t* lcm = (lcm_t*) lcm_ptr;
	// Blocking wait for new data
	while (1)
	{
		lcm_handle (lcm);
	}
	return NULL;
		}

int main (int argc, char ** argv)
{
	lcm_t * lcm;

	lcm = lcm_create ("udpm://");
	if (!lcm)
		return 1;

	mavconn_mavlink_msg_container_t_subscription_t * comm_sub =
			mavconn_mavlink_msg_container_t_subscribe (lcm, MAVLINK_MAIN, &mavlink_handler, lcm);

	// Thread
	GThread* lcm_thread;
	GError* err;

	if( !g_thread_supported() )
	{
		g_thread_init(NULL);
		// Only initialize g thread if not already done
	}

	if( (lcm_thread = g_thread_create((GThreadFunc)lcm_wait, (void *)lcm, TRUE, &err)) == NULL)
	{
		printf("Thread create failed: %s!!\n", err->message );
		g_error_free ( err ) ;
	}

	while (1)
	{
		//lcm_handle (lcm);
		usleep(1000000);
		printf("Waited another second while still receiving data in parallel\n");
	}

	mavconn_mavlink_msg_container_t_unsubscribe (lcm, comm_sub);
	lcm_destroy (lcm);
	g_thread_join(lcm_thread);
	return 0;
}

