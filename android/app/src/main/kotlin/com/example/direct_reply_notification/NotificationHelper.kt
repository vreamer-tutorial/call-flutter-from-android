package com.example.direct_reply_notification

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.PendingIntent
import android.content.Context
import android.content.Intent
import android.graphics.Color
import android.os.Build
import androidx.core.app.NotificationCompat
import androidx.core.app.NotificationManagerCompat
import androidx.core.app.RemoteInput

object NotificationHelper {
    private const val CHANNEL_ID = "01"
    private const val CHANNEL_NAME = "Ideas"
    private const val NOTIFICATION_ID = 101
    const val KEY_TEXT_REPLY = "key_text_reply"

    fun createChannel(context: Context) {
        val manager = NotificationManagerCompat.from(context)

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val importance = NotificationManager.IMPORTANCE_DEFAULT
            val channel = NotificationChannel(CHANNEL_ID, CHANNEL_NAME, importance)
            channel.description = "channel"
            channel.enableVibration(false)
            channel.enableLights(true)
            channel.lightColor = Color.RED
            manager.createNotificationChannel(channel)
        }
    }

    fun showNotification(context: Context) {
        val remoteInput = RemoteInput.Builder(KEY_TEXT_REPLY)
                .build()

        val resultIntent = Intent(context, NotificationReceiver::class.java)

        val resultPendingIntent = PendingIntent.getBroadcast(
                context,
                0,
                resultIntent,
                0
        )

        val replyAction = NotificationCompat.Action.Builder(
                android.R.drawable.ic_input_add,
                "Add", resultPendingIntent)
                .addRemoteInput(remoteInput)
                .build()

        val notification = NotificationCompat.Builder(context, CHANNEL_ID).setDefaults(Notification.DEFAULT_ALL)
                .setSmallIcon(R.mipmap.ic_launcher)
                .setPriority(NotificationCompat.PRIORITY_HIGH)
                .setContentTitle("Got new ideas? Add Here!")
                .setColor(Color.BLUE)
                .setAutoCancel(true)
                .setOnlyAlertOnce(true)
                .addAction(replyAction)
                .build()

        NotificationManagerCompat.from(context).notify(NOTIFICATION_ID, notification)
    }
}